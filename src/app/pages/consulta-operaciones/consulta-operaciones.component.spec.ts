import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ConsultaOperacionesComponent } from './consulta-operaciones.component';

describe('ConsultaOperacionesComponent', () => {
  let component: ConsultaOperacionesComponent;
  let fixture: ComponentFixture<ConsultaOperacionesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ConsultaOperacionesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ConsultaOperacionesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
