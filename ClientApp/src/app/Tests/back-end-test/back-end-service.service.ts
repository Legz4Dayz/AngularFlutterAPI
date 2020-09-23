import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { command } from 'src/app/models/command';
import { commandPipeTest } from 'src/app/models/commandPipeTest';

@Injectable({
  providedIn: 'root'
})
export class BackEndService {

  constructor(private http: HttpClient) { }

  
  commandList$ = this.http.get<command[]>('https://localhost:5001/api/commands/');

  singleCommand$ = this.http.get<command>('https://localhost:5001/api/commands/3');
    
}
