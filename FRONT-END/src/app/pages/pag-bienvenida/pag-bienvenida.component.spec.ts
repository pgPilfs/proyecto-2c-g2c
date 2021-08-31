import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PagBienvenidaComponent } from './pag-bienvenida.component';

describe('PagBienvenidaComponent', () => {
  let component: PagBienvenidaComponent;
  let fixture: ComponentFixture<PagBienvenidaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PagBienvenidaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PagBienvenidaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
