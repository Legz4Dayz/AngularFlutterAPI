import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { SignInService } from 'src/app/shared/sign-in-service.service';

@Component({
  selector: 'app-create-account',
  templateUrl: './create-account.component.html',
  styleUrls: ['./create-account.component.css']
})
export class CreateAccountComponent implements OnInit {

  constructor( private route: Router, private signinService : SignInService, private fb: FormBuilder) { }
  ngOnInit(): void {
    }

  validationResult: boolean;

  loginControl = this.fb.group({
      username: [null, Validators.required],
      password: [null, 
        [Validators.pattern('^(?=[^A-Z]*[A-Z])(?=[^a-z]*[a-z])(?=\\D*\\d)[A-Za-z\\d!$%@#£€*?&]{8,}$'),
                    Validators.required]],
      passwordMatch: [null, Validators.required]
    }, 
    {validator: this.checkIfMatchingPasswords('password', 'passwordMatch') }
  );

  checkIfMatchingPasswords(passwordKey: string, passwordConfirmationKey: string) {
    return (group: FormGroup) => {
      let passwordInput = group.controls[passwordKey],
          passwordConfirmationInput = group.controls[passwordConfirmationKey];
      if (passwordInput.value !== passwordConfirmationInput.value) {
        return passwordConfirmationInput.setErrors({notEquivalent: true})
      }
      else {
          return passwordConfirmationInput.setErrors(null);
      }
    }
  }

  validateUsername() : boolean {
    return this.loginControl.get('username').invalid;
  }

  validatePassword() : boolean {
    return this.loginControl.get('password').invalid; 
  }

  validatePasswordTouched() : boolean {
    return this.loginControl.get('password').invalid && this.loginControl.get('password').dirty;
  }

  validateMatch() : boolean {
    return this.loginControl.get('passwordMatch').invalid;
  }

  onSubmit(form){

    if(this.loginControl.invalid)
    {
      alert('Fail');
      return;
    }

    this.signinService.createUser(form).subscribe(
    data => {
      if(data){
      this.route.navigate(['/home']);
    }});
  }

}