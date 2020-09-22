import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl, Validator, Validators} from '@angular/forms';
import { Router } from '@angular/router';

import {signIn} from 'src/app/models/sign-in';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  loginControl: FormGroup;
  username: FormControl
  password: FormControl

  constructor( private route: Router) { }
  ngOnInit(): void {
    this.username = new FormControl(Validators.required);
    this.password = new FormControl(Validators.required);
    
    this.loginControl = new FormGroup({
    username: this.username,
    password: this.password
  });
}
  onSubmit(form){

  }

  validateUsername() : boolean {
    return this.username.invalid || this.username.touched;
  }

  validatePassword() : boolean {
    return this.password.invalid || this.password.touched;
  }

}


