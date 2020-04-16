import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule,ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';

import { DoctorComponent } from "./doctor/doctor.component";
import { PacientesComponent } from "./pacientes/pacientes.component";

import { PacientesService } from "./service/pacientes.service";
@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    DoctorComponent,
    PacientesComponent,

  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule, ReactiveFormsModule,
    RouterModule.forRoot([
      { path: '', component: HomeComponent, pathMatch: 'full' },
      { path: 'doctor', component: DoctorComponent },
      { path: 'pacientes', component: PacientesComponent }
    ])
  ],
  providers: [PacientesService],
  bootstrap: [AppComponent]
})
export class AppModule { }
