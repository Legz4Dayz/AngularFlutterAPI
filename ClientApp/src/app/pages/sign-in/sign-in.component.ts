import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl, Validator, Validators, FormBuilder} from '@angular/forms';
import { Router } from '@angular/router';

import {signIn} from 'src/app/models/sign-in';
import { SignInService } from 'src/app/shared/sign-in-service.service';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  constructor( private route: Router, private signinService : SignInService, private fb: FormBuilder) { }
  ngOnInit(): void {
    }

    
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
    console.log(form.username)
    var response = this.signinService.validateUser(form);
    response ? this.route.navigate(['/home']) : '';
  }
}


