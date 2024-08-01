// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract MedicalData {

    // create a struct of patient data
    struct Patient{
        string name;
        string bloodType;
        uint age;
        string[] symptoms;
        string[] drugs;
    }
    // initialize a mapping of the struct
    mapping (address => Patient) public patients;
    // create a function to add the patient data
    function addPatient(string memory _name, string memory _bloodType, uint _age, 
    string[] memory _symptoms, string[] memory _drugs) public {
        Patient memory patient = Patient({
            name: _name,
            bloodType: _bloodType,
            age: _age,
            symptoms: _symptoms,
            drugs: _drugs
        });
        patients[msg.sender] = patient;
        
    }
    // create a function to update the patient's data
    function updatePatient(string[] memory _symptoms, string[] memory _drugs) public {
        Patient storage patient = patients[msg.sender];
        patient.symptoms = _symptoms;
        patient.drugs = _drugs;
    }
    // create a function to return all the items in the struct
    function getPatientInfo(address _addr) public view returns(string memory, string memory, uint, string[] memory, string[] memory) {
        Patient memory patient = patients[_addr];
        return(patient.name, patient.bloodType, patient.age, patient.symptoms, patient.drugs);
    }
}