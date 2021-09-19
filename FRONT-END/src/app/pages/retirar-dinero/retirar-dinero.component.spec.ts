import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RetirarDineroComponent } from './retirar-dinero.component';

describe('RetirarDineroComponent', () => {
  let component: RetirarDineroComponent;
  let fixture: ComponentFixture<RetirarDineroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RetirarDineroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(RetirarDineroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
