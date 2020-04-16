import { Injectable, Inject } from "@angular/core";
import { Pacientes } from "../interfaces";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Observable } from "rxjs";
import { error } from "protractor";

const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
    'Auten':''
  })
}

@Injectable({
  providedIn: 'root'
})

export class PacientesService {
  baseUrl: string;
  constructor (protected http : HttpClient, @Inject("BASE_URL") baseUrl: string) {
    this.baseUrl = baseUrl;
  }

  //Llama al metodo que lista todos los pacientes de la base de datos
  public GetPacientes(): Observable<Pacientes[]> {
    return this.http.get<Pacientes[]>(this.baseUrl + "api/Pacientes/ConsultarPacientes");
  }

  //Envia los valores a la funcion AddPaciente de PacienteControllers para insertar en la bd
  public AddPaciente(nombre, numerodesegurosocial, codigopostal, telefono, ceduladoctor) {

      this.http.post<Response>(this.baseUrl + "api/Pacientes/AddPaciente",
      { 'Nombre': nombre, 'NumeroDeSeguroSocial': numerodesegurosocial, 'CodigoPostal': codigopostal, 'Telefono': telefono, 'CedulaDoctor': ceduladoctor }
        , httpOptions).subscribe(result => {
        console.log(result);
      },
      error => console.error(error));

  }
 
  public UpdatePaciente(id, nombre, numerodesegurosocial, codigopostal, telefono, ceduladoctor) {
      this.http.put<Response>(this.baseUrl + "api/Pacientes/ModPaciente",
      { 'Id':id, 'Nombre': nombre, 'NumeroDeSeguroSocial': numerodesegurosocial, 'CodigoPostal': codigopostal, 'Telefono': telefono, 'CedulaDoctor': ceduladoctor }
        , httpOptions).subscribe(result => {
          console.log(result);
      },
        error => console.error(error));
  }


   public DeletePaciente(id) {
      console.log("LLego a borrar" + id);
     console.log("api/Pacientes/DelPaciente" + id);
      this.http.delete(this.baseUrl + "api/Pacientes/DelPaciente"+id,httpOptions).subscribe(result => {
      console.log(result);
    }, error => console.error(error));
  }
  
}
