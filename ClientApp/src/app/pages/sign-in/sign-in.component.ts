import { Component, OnInit } from '@angular/core';
import {FormGroup, FormControl} from '@angular/forms';
import { Router } from '@angular/router';

import {signIn} from 'src/app/models/sign-in';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  constructor( private route: Router) { }

  loginControl: FormGroup;



  ngOnInit(): void {
    
  let username = new FormControl();
  let password = new FormControl();
  this.loginControl = new FormGroup({
    username: username,
    password: password
  })
  }


  onSubmit(form : signIn){
    console.log(form.password);
  }
}


