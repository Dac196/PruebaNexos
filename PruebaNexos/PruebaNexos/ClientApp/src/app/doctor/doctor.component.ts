import { Component, Inject } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { DoctoresService } from '../service/doctores.service';
import { Doctores } from '../interfaces';
import { Observable } from 'rxjs';

@Component({
    selector: 'doctor-app',
    templateUrl: './doctor.component.html'
})
export class DoctorComponent {
  public lstdoctores: Observable<Doctores[]>;


  constructor(http: HttpClient, @Inject("BASE_URL") baseUrl: string,
    protected doctoresservices: DoctoresService) {

    this.GetDoctores();
  }
  public GetDoctores() {
    this.lstdoctores = this.doctoresservices.GetDoctores();
  }
 
}
