import { Injectable, Inject } from "@angular/core";
import { Doctores } from "../interfaces";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Observable } from "rxjs";
import { error } from "protractor";

@Injectable({
  providedIn: 'root'
})

export class DoctoresService {
  baseUrl: string;
  constructor(protected http: HttpClient, @Inject("BASE_URL") baseUrl: string) {
    this.baseUrl = baseUrl;
  }

  //Llama al metodo que lista todos los pacientes de la base de datos
  public GetDoctores(): Observable<Doctores[]> {
    return this.http.get<Doctores[]>(this.baseUrl + "api/Doctores/ConsultarDoctores");
  }
}
