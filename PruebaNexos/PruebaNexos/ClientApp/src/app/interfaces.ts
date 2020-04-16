//interface para pacientes
export interface Pacientes {
  Id: number,
  Nombre: string,
  NumeroDeSeguroSocial: number,
  CodigoPostal: number,
  Telefono: number,
  CedulaDoctor: string;
}
//interface para Doctores
export interface Doctores {
  Id:number,
  Nombre: string,
  NumeroDeCredencial: number,
  Hospital: string;
}

//interface para las respuestas desde la bd
export interface Response {
  Succes: number,
  Data: any,
  Message: string;
}

