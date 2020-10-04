import { ChangeDetectionStrategy, Component, HostListener, OnInit } from '@angular/core';
import { Validators, FormBuilder} from '@angular/forms';
import { Router } from '@angular/router';

import {signIn} from 'src/app/models/sign-in';
import { SignInService } from 'src/app/shared/sign-in-service.service';
import { Observable, of, EMPTY, BehaviorSubject, Subject, combineLatest, fromEvent, pipe} from 'rxjs';
import { catchError, map, tap, throttleTime } from 'rxjs/operators';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css'
  ],
  // changeDetection: ChangeDetectionStrategy.OnPush
})
export class SignInComponent implements OnInit {
  
  constructor( private route: Router, private signinService : SignInService, private fb: FormBuilder) { }
  ngOnInit(): void {
  }

  validationAction$ = new BehaviorSubject<boolean>(null);
  show = false;
  successText = 'Successful Sign-In';
  failureText = 'No Matching Username or Password Found';

  action$ = fromEvent(document.getElementById('Test'), 'click');

  loginControl = this.fb.group({
    username: ['', Validators.required],
    password: ['', Validators.required]
  });

  validateUsername() : boolean {
    return this.loginControl.get('username').invalid || this.loginControl.get('username').touched;
  }

  validatePassword() : boolean {
    return this.loginControl.get('password').invalid || this.loginControl.get('password').touched;
  }

  onSubmit(form){
    this.show = true;
    if(this.loginControl.valid)
    {
      this.signinService.validateUser(form).subscribe(
        data => {
            if(data){
              this.validationAction$.next(true)
              setTimeout( ()=> this.route.navigate(['/home']), 1000);
            }
            else
              this.validationAction$.next(false);
          },
        error => {console.log(error); this.validationAction$.next(false);}
      );
    }
    else
      this.validationAction$.next(false);
  }
}