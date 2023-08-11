import { Component, OnInit } from '@angular/core';
import { HttpClientService } from 'src/app/services/http-client.service';
import * as Highcharts from 'highcharts';
import { RhapCommpointData } from 'src/app/models/RhapCommpointData';
import { formatDate } from '@angular/common';

@Component({
  selector: 'app-rhapdata',
  templateUrl: './rhapdata.component.html',
  styleUrls: ['./rhapdata.component.scss'],
})
export class RhapdataComponent implements OnInit {
  alertThreshold = 5;
  alertColor = 'red';
  warningThreshold = 10;
  warningColor = 'orange';
  commpointId = '854';

  Highcharts: typeof Highcharts = Highcharts;
  chartConstructor: string = 'chart';
  chartCallback: Highcharts.ChartCallbackFunction = function (chart) {};
  updateFlag: boolean = true;
  oneToOneFlag: boolean = true;
  runOutsideAngular: boolean = false;
  chartOptions: Highcharts.Options = {
    title: { text: 'iPM Ingress rate' },
    subtitle: { text: 'into Rhapsody' },
    series: [
      {
        data: [],
        type: 'line',
      },
    ],
  };

  MapData(
    value: RhapCommpointData,
    index: number,
    array: Array<RhapCommpointData>
  ): any {
    if (index > 0) {
      const timespanSeconds = Math.round(
        Math.round(new Date(value.date).getTime() - new Date(array[index - 1].date).getTime()) / 1000
      );
      const countDiff = value.receivedCount - array[index - 1].receivedCount;
      const rate = timespanSeconds == 0 ? 0 : Math.round((countDiff / timespanSeconds) * 60);

      return {
        x: index,
        y: rate,
        name: formatDate(array[index].date, 'dd/MM/yyyy HH:mm:ss', 'en-AU'),
        color: (() => { if (rate < 5) { return 'red'; } else if (rate < 10) { return 'orange'; } else { return 'blue'; } })(),
      };
    } else return { x: 0, y: 0, name: '' };
  }

  constructor(public client: HttpClientService) {}

  ngOnInit(): void {
    this.client.loadCommpointData(this.commpointId).subscribe(() => {
      console.log(this.client.rhapsodyData);

      this.chartOptions = {
        xAxis: {
          title: { text: 'Time' },
          type: 'category',
          categories: [],
          tickInterval: 60,
        },
        yAxis: {
          title: { text: 'messages/minute' },
          tickInterval: 10,
        },
        series: [
          {
            name: 'Ingress',
            data: this.client.rhapsodyData
              .map(this.MapData)
              .filter((val, index) => index > 0),
            type: 'spline',
            tooltip: {
              valueSuffix: ' message(s)/min'
            }
            //,           pointInterval: 1 * 3600 * 1000
          }
        ],
        legend: { enabled: true },
      };
    });

    setInterval(() => {
      Highcharts.charts.forEach((c) => {
        this.client.loadCommpointData(this.commpointId).subscribe(() => {
          var data = this.client.rhapsodyData
            .map(this.MapData)
            .filter((val, index) => index > 0);
          c?.series[0].setData(data, true, true, true);
        });
      });
    }, 59000);
  }
}
