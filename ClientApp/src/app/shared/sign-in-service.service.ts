import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { tap } from 'rxjs/operators';
import { signIn } from '../models/sign-in';
import { Subscription, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SignInService {

  backend = "https://localhost:5000/api/";

  validation$ : Observable<boolean>;

  constructor(private http: HttpClient) {}

  validateUser( attempt : signIn) : Observable<boolean>{
    // console.log(JSON.stringify(attempt));
    
    return this.http.post<boolean>(this.backend +'users', attempt).pipe(
    tap(data => console.log(data)));
  }

  createUser( create : signIn) :Observable<boolean>{

    return this.http.post<boolean>(this.backend + 'admin', create ).pipe(
      tap(data => console.log(data))
    );
  }


    
}
