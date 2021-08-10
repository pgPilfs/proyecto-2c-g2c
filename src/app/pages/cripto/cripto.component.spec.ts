import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CriptoComponent } from './cripto.component';

describe('CriptoComponent', () => {
  let component: CriptoComponent;
  let fixture: ComponentFixture<CriptoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CriptoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CriptoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
