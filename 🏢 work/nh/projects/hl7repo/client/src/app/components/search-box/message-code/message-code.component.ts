import {COMMA, ENTER, SPACE} from '@angular/cdk/keycodes';
import {Component, ElementRef, ViewChild, OnInit, Input, Output, EventEmitter} from '@angular/core';
import {FormControl} from '@angular/forms';
import {MatAutocompleteSelectedEvent} from '@angular/material/autocomplete';
import {MatChipInputEvent} from '@angular/material/chips';
import {Observable} from 'rxjs';
import {map, startWith} from 'rxjs/operators';

@Component({
  selector: 'app-message-code',
  templateUrl: './message-code.component.html',
  styleUrls: ['./message-code.component.scss']
})
export class MessageCodeComponent implements OnInit {
  selectable = true;
  removable = true;
  separatorKeysCodes: number[] = [ENTER, COMMA, SPACE];
  messageCodeCtrl = new FormControl();
  filteredCodes: Observable<string[]>;
  messageCodes: string[] = [];
  @Output() messageCodesChanged: EventEmitter<any> = new EventEmitter();
  @Input() allCodes: string[] = [];

  @ViewChild('messageCodeInput') messageCodeInput!: ElementRef<HTMLInputElement>;

  constructor() {
    this.filteredCodes = this.messageCodeCtrl.valueChanges.pipe(
        startWith(null),
        map((messageCode: string | null) => messageCode ?
          this._filter(messageCode) :
          this.allCodes.slice().filter(c => !this.messageCodes.includes(c))));
  }

  add(event: MatChipInputEvent): void {
    const value = (event.value || '').trim().toUpperCase();

    // Add MessageCode
    if (value && this.allCodes.includes(value)) {
      this.messageCodes.push(value);
    }

    // Clear the input value
    event.chipInput!.clear();

    this.messageCodeCtrl.setValue(null);

    this.messageCodesChanged.emit(this.messageCodes);
  }

  remove(messageCode: string): void {
    const index = this.messageCodes.indexOf(messageCode);

    if (index >= 0) {
      this.messageCodes.splice(index, 1);
      this.messageCodesChanged.emit(this.messageCodes);
      this.messageCodeCtrl.setValue(null);
    }
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    this.messageCodes.push(event.option.viewValue);
    this.messageCodeInput.nativeElement.value = '';
    this.messageCodeCtrl.setValue(null);
    this.messageCodesChanged.emit(this.messageCodes);
 }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.allCodes.filter(code => code.toLowerCase().includes(filterValue)
      && !this.messageCodes.includes(code));
  }

  ngOnInit(): void {
  }

}
