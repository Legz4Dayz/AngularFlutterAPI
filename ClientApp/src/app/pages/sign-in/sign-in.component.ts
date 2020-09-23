import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl, Validator, Validators} from '@angular/forms';
import { Router } from '@angular/router';

import {signIn} from 'src/app/models/sign-in';
import { SignInService } from 'src/app/shared/sign-in-service.service';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  loginControl: FormGroup;
  username: FormControl
  password: FormControl

  constructor( private route: Router, private signinService : SignInService) { }
  ngOnInit(): void {
    this.username = new FormControl('', Validators.required);
    this.password = new FormControl('', Validators.required);
    
    this.loginControl = new FormGroup({
    username: this.username,
    password: this.password
     });
  }

  onSubmit(form){

    var response = this.signinService.validateUser(form);
    response = true;
    response ? this.route.navigate(['/home']) : '';
  }

  validateUsername() : boolean {
    return this.username.invalid || this.username.touched;
  }

  validatePassword() : boolean {
    return this.password.invalid || this.password.touched;
  }

}


