import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ExtraerDineroComponent } from './extraer-dinero.component';

describe('ExtraerDineroComponent', () => {
  let component: ExtraerDineroComponent;
  let fixture: ComponentFixture<ExtraerDineroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ExtraerDineroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ExtraerDineroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
