import { Component, OnInit } from '@angular/core';
import {NgForm} from '@angular/forms';
import { Router } from '@angular/router';

import {signIn} from 'src/app/models/sign-in';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.css']
})
export class SignInComponent implements OnInit {

  constructor( private route: Router) { }

  loginAttempt: signIn = {
    username : null,
    password : null
  }

  ngOnInit(): void {
  }


  onSubmit(form){
    
  }
}


