import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { tap } from 'rxjs/operators';
import { signIn } from '../models/sign-in';
import { Subscription, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SignInService {

  backend = "https://localhost:5001/api/users";

  validation$;  

  constructor(private http: HttpClient) {}

   validateUser( attempt : signIn){
     console.log(JSON.stringify(attempt));
     this.validation$ = this.http.post<boolean>(this.backend, attempt).pipe(
      tap(x => console.log(x))
    );
    // console.log(response["data"]);
    // console.log(response);
    // return response["data"] ? true : false; 
  }


    
}
