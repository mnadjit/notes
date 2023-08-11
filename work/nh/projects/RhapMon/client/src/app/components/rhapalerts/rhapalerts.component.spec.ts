import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RhapalertsComponent } from './rhapalerts.component';

describe('RhapalertsComponent', () => {
  let component: RhapalertsComponent;
  let fixture: ComponentFixture<RhapalertsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RhapalertsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RhapalertsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
