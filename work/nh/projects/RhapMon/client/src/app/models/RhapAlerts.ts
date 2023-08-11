export class RhapAlerts {
  alertCount: number = 0;
  highestSeverity: string = "";
  alerts: Alert[] = [];
}

class Alert {
  id: number = 0;
  alertName: string = "";
  alertMnemonic: string = "";
  alertDescription: string = "";
  timestamp: string = "";
  state: string = "";
  severity: string = "";
  componentInfo: ComponentInfo = new ComponentInfo();
  parameters: Parameter[] = [];
  assignee?: any;
}

class ComponentInfo {
  id: number = 0;
  name: string = "";
  folderPath: string = "";
}

class Parameter {
  id: number = 0;
  displayName: string = "";
  value: string = "";
}



