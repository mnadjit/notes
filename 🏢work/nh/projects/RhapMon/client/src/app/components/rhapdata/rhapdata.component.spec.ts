import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RhapdataComponent } from './rhapdata.component';

describe('RhapdataComponent', () => {
  let component: RhapdataComponent;
  let fixture: ComponentFixture<RhapdataComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RhapdataComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RhapdataComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});