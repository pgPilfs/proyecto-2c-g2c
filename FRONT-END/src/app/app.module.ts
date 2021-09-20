import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HomeComponent } from './pages/home/home.component';
import { RegistroComponent } from './pages/registro/registro.component';
import { LayoutModule } from './layout/layout.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TransaccionComponent } from './transaccion/transaccion.component';
import { PagBienvenidaComponent } from './pages/pag-bienvenida/pag-bienvenida.component';
import { LoginTestComponent } from './login-test/login-test.component';
import { ConsultaSaldoComponent } from './pages/consulta-saldo/consulta-saldo.component';


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    RegistroComponent,
    TransaccionComponent,
    PagBienvenidaComponent,
    LoginTestComponent,
    ConsultaSaldoComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    LayoutModule,
    ReactiveFormsModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
