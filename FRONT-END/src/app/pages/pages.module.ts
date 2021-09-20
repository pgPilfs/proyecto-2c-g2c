import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {ReactiveFormsModule } from '@angular/forms';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { ConsultaSaldoComponent } from './consulta-saldo/consulta-saldo.component';

@NgModule({
  declarations: [
    ConsultaSaldoComponent
  ],
  imports: [
    CommonModule,
    ReactiveFormsModule, 
    NgModule,
    BrowserAnimationsModule,
   
  ]
})
export class PagesModule { }
