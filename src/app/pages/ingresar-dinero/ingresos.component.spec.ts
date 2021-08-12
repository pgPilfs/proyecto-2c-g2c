import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IngresarDineroComponent } from './ingreso.component';

describe('IngresarDineroComponent', () => {
  let component: IngresarDineroComponent;
  let fixture: ComponentFixture<IngresarDineroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ IngresarDineroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(IngresarDineroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
