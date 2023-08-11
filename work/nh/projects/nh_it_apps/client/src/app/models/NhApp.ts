import { AppService } from './AppService';
import { Contact } from './Contact';

export class NhApp {
  id: number = 0;
  name: string = '';
  environment: string = '';
  description: string = '';
  mainDepartment: string = '';
  vendor: string = '';
  contacts: Contact[] = [];
  appServices: AppService[] = [];
  comments: string = '';
}
