import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MessageCodeComponent } from './message-code.component';

describe('MessageCodeComponent', () => {
  let component: MessageCodeComponent;
  let fixture: ComponentFixture<MessageCodeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MessageCodeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MessageCodeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
