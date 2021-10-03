import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';


import { LayoutModule } from './layout/layout.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TransferenciaComponent } from './pages/transferencia/transferencia.component';
import { PagBienvenidaComponent } from './pages/pag-bienvenida/pag-bienvenida.component';
import { UltMovComponent } from './pages/ultMovimientos/ult-mov/ult-mov.component';
import { RegisterComponent } from './pages/register/register.component';
import { InicioSesionComponent } from './pages/inicio-sesion/inicio-sesion.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { LocalidadService } from './service/localidad.service';
import { ClienteService } from './service/cliente.service';
import { RouterModule } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { JwtInterceptor } from './service/auth/interceptor.service';
import { ErrorInterceptor } from './service/auth/error.service';
import { IngresarDineroComponent } from './pages/ingresar-dinero/ingresos.component';
import { RetirarDineroComponent } from './pages/retirar-dinero/retirar-dinero.component';



@NgModule({
  declarations: [
    AppComponent,
    TransferenciaComponent,
    PagBienvenidaComponent,
    UltMovComponent,
    RegisterComponent,
    InicioSesionComponent,
    HomeComponent,
    IngresarDineroComponent,
    RetirarDineroComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    RouterModule,
    LayoutModule,
    ReactiveFormsModule,
    FormsModule, 
    HttpClientModule,
  ],
  providers: [
    LocalidadService,
    ClienteService,
    { provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true },
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
