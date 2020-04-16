import { Component, Inject } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { FormControl } from "@angular/forms"; 
import { PacientesService } from '../service/pacientes.service';
import { Pacientes } from '../interfaces';
import { Observable } from 'rxjs';

@Component({
    selector: 'pacientes-app',
    templateUrl: './pacientes.component.html'
})
export class PacientesComponent {
  
  public lstpaciente: Observable<Pacientes[]>;

  id = new FormControl('');
  nombreControl = new FormControl('');
  numSegSocialControl = new FormControl('');
  codPostalControl = new FormControl('');
  telefonoControl = new FormControl('');
  cedDoctorControl = new FormControl('');


 
  constructor(http: HttpClient, @Inject("BASE_URL") baseUrl: string,
    protected pacientesservice: PacientesService) {

    this.GetPacientes();
  }
  public GetPacientes() {
    this.lstpaciente = this.pacientesservice.GetPacientes();
  }

  public Registrar() {

    this.pacientesservice.AddPaciente(this.nombreControl.value, this.numSegSocialControl.value, this.codPostalControl.value,
    this.telefonoControl.value, this.cedDoctorControl.value);

    setTimeout(() => {
      this.GetPacientes();
    }, 300);

    this.nombreControl.setValue('');
    this.numSegSocialControl.setValue('');
    this.codPostalControl.setValue('');
    this.telefonoControl.setValue('');
    this.cedDoctorControl.setValue('');
  }

  public Modificar() {
    this.pacientesservice.UpdatePaciente(this.id.value, this.nombreControl.value, this.numSegSocialControl.value, this.codPostalControl.value,
      this.telefonoControl.value, this.cedDoctorControl.value);
    setTimeout(() => {
      this.GetPacientes();
    }, 300);
  }


  public Eliminar() {
    this.pacientesservice.DeletePaciente(this.id.value);
    setTimeout(() => {
      this.GetPacientes();
    }, 300);

    this.id.setValue('');
  }
 
}



