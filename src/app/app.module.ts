import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HomeComponent } from './pages/home/home.component';
import { RegistroComponent } from './pages/registro/registro.component';
import { LayoutModule } from './layout/layout.module';
import { RetirarDineroComponent } from './pages/retirar-dinero/retirar-dinero.component';
import { ConsultaOperacionesComponent } from './pages/consulta-operaciones/consulta-operaciones.component';
import { SoporteTecnicoComponent } from './pages/soporte-tecnico/soporte-tecnico.component';
import { ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    RegistroComponent,
    RetirarDineroComponent,
    ConsultaOperacionesComponent,
    SoporteTecnicoComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    LayoutModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
