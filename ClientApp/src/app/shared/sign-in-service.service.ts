import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SignInServiceService {

  constructor(private http: HttpClient) {

    const backend = "https://localhost:5001/api/commander";
    let x = this.http.post(backend, "");
   }
}
