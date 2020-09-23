import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { signIn } from '../models/sign-in';

@Injectable({
  providedIn: 'root'
})
export class SignInService {

  backend = "https://localhost:5001/api/commander";

  constructor(private http: HttpClient) {}

   validateUser( attempt : signIn){
    var response = this.http.post(this.backend, attempt);
    
    return response["data"] ? true : false; 
  }
    
}
