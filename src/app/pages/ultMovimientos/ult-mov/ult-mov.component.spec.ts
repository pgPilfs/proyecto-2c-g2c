import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UltMovComponent } from './ult-mov.component';

describe('UltMovComponent', () => {
  let component: UltMovComponent;
  let fixture: ComponentFixture<UltMovComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UltMovComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UltMovComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
