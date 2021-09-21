import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HomeComponent } from './pages/home/home.component';
import { RegistroComponent } from './pages/registro/registro.component';
import { LayoutModule } from './layout/layout.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TransferenciaComponent } from './pages/transferencia/transferencia.component';
import { PagBienvenidaComponent } from './pages/pag-bienvenida/pag-bienvenida.component';
import { LoginComponent } from './pages/login/login.component';
import { UltMovComponent } from './pages/ultMovimientos/ult-mov/ult-mov.component';
import { RegisterComponent } from './pages/register/register.component';
import { InicioSesionComponent } from './pages/inicio-sesion/inicio-sesion.component';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { LocalidadService } from './service/localidad.service';
import { ClienteService } from './service/cliente.service';


@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    RegistroComponent,
    TransferenciaComponent,
    PagBienvenidaComponent,
    LoginComponent,
    UltMovComponent,
    RegisterComponent,
    InicioSesionComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    LayoutModule,
    ReactiveFormsModule,
    FormsModule, 
    HttpClientModule,
  ],
  providers: [ClienteService, LocalidadService],
  bootstrap: [AppComponent]
})
export class AppModule { }
