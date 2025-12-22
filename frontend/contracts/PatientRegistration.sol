// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PatientRegistration {
    struct Patient {
        address walletAddress;
        string name;
        string dateOfBirth;
        string gender;
        string bloodGroup;
        string homeAddress;
        string email;
        string hhNumber;
        string password;
    }

    struct PatientList {
        string patient_number;
        string patient_name;
    }

    struct DoctorList {
        string doctor_number;
    }

    mapping(string => bool) public isPatientRegistered;
    mapping(string => Patient) public patients;

    // doctorNumber => list of patients (who gave access)
    mapping(string => PatientList[]) private Dpermission;

    // patientNumber => list of doctors (who got access)
    mapping(string => DoctorList[]) private Ppermission;

    // Access permission mapping
    mapping(string => mapping(string => bool)) public doctorPermissions;

    string[] public allPatientHHNumbers;

    event PatientRegistered(
        string hhNumber,
        string name,
        address walletAddress
    );
    event PermissionGranted(string patientNumber, string doctorNumber);
    event PermissionRevoked(string patientNumber, string doctorNumber);

    function registerPatient(
        address _walletAddress,
        string memory _name,
        string memory _dateOfBirth,
        string memory _gender,
        string memory _bloodGroup,
        string memory _homeAddress,
        string memory _email,
        string memory _hhNumber,
        string memory _password
    ) external {
        require(!isPatientRegistered[_hhNumber], "Patient already registered");

        Patient memory newPatient = Patient({
            walletAddress: _walletAddress,
            name: _name,
            dateOfBirth: _dateOfBirth,
            gender: _gender,
            bloodGroup: _bloodGroup,
            homeAddress: _homeAddress,
            email: _email,
            hhNumber: _hhNumber,
            password: _password
        });

        patients[_hhNumber] = newPatient;
        isPatientRegistered[_hhNumber] = true;
        allPatientHHNumbers.push(_hhNumber);

        emit PatientRegistered(_hhNumber, _name, _walletAddress);
    }

    
    function isRegisteredPatient(
        string memory _hhNumber
    ) external view returns (bool) {
        return isPatientRegistered[_hhNumber];
    }

    function validatePassword(
        string memory _hhNumber,
        string memory _password
    ) external view returns (bool) {
        require(isPatientRegistered[_hhNumber], "Patient not registered");
        return
            keccak256(abi.encodePacked(_password)) ==
            keccak256(abi.encodePacked(patients[_hhNumber].password));
    }

    function getAllPatients()
        external
        view
        returns (
            string[] memory names,
            string[] memory dateOfBirths,
            string[] memory genders,
            string[] memory bloodGroups,
            string[] memory homeAddresses,
            string[] memory emails,
            string[] memory hhNumbers
        )
    {
        uint256 len = allPatientHHNumbers.length;

        names = new string[](len);
        dateOfBirths = new string[](len);
        genders = new string[](len);
        bloodGroups = new string[](len);
        homeAddresses = new string[](len);
        emails = new string[](len);
        hhNumbers = new string[](len);

        for (uint256 i = 0; i < len; i++) {
            string memory hh = allPatientHHNumbers[i];
            Patient memory patient = patients[hh];

            names[i] = patient.name;
            dateOfBirths[i] = patient.dateOfBirth;
            genders[i] = patient.gender;
            bloodGroups[i] = patient.bloodGroup;
            homeAddresses[i] = patient.homeAddress;
            emails[i] = patient.email;
            hhNumbers[i] = patient.hhNumber;
        }
    }

    function getPatientDetails(
        string memory _hhNumber
    )
        external
        view
        returns (
            address walletAddress,
            string memory name,
            string memory dateOfBirth,
            string memory gender,
            string memory bloodGroup,
            string memory homeAddress,
            string memory email
        )
    {
        require(isPatientRegistered[_hhNumber], "Patient not registered");
        Patient memory patient = patients[_hhNumber];
        return (
            patient.walletAddress,
            patient.name,
            patient.dateOfBirth,
            patient.gender,
            patient.bloodGroup,
            patient.homeAddress,
            patient.email
        );
    }

    // ✅ Grant permission to doctor
    function grantPermission(
        string memory _patientNumber,
        string memory _doctorNumber,
        string memory _patientName
    ) external {
        require(
            !doctorPermissions[_patientNumber][_doctorNumber],
            "Access already granted"
        );

        // Add patient info to Dpermission (doctor's view)
        Dpermission[_doctorNumber].push(
            PatientList({
                patient_number: _patientNumber,
                patient_name: _patientName
            })
        );

        // Add doctor info to Ppermission (patient's view)
        Ppermission[_patientNumber].push(
            DoctorList({doctor_number: _doctorNumber})
        );

        doctorPermissions[_patientNumber][_doctorNumber] = true;
        emit PermissionGranted(_patientNumber, _doctorNumber);
    }

    // ✅ Revoke permission
    function revokePermission(
        string memory _patientNumber,
        string memory _doctorNumber
    ) external {
        require(
            doctorPermissions[_patientNumber][_doctorNumber],
            "Permission not granted"
        );

        // Remove from Dpermission
        PatientList[] storage plist = Dpermission[_doctorNumber];
        for (uint i = 0; i < plist.length; i++) {
            if (
                keccak256(abi.encodePacked(plist[i].patient_number)) ==
                keccak256(abi.encodePacked(_patientNumber))
            ) {
                plist[i] = plist[plist.length - 1];
                plist.pop();
                break;
            }
        }

        // Remove from Ppermission
        DoctorList[] storage dlist = Ppermission[_patientNumber];
        for (uint i = 0; i < dlist.length; i++) {
            if (
                keccak256(abi.encodePacked(dlist[i].doctor_number)) ==
                keccak256(abi.encodePacked(_doctorNumber))
            ) {
                dlist[i] = dlist[dlist.length - 1];
                dlist.pop();
                break;
            }
        }

        doctorPermissions[_patientNumber][_doctorNumber] = false;
        emit PermissionRevoked(_patientNumber, _doctorNumber);
    }

    function isPermissionGranted(
        string memory _patientNumber,
        string memory _doctorNumber
    ) external view returns (bool) {
        return doctorPermissions[_patientNumber][_doctorNumber];
    }

    function getPermissionGrantedDoctors(
        string memory _patientNumber
    ) external view returns (DoctorList[] memory) {
        return Ppermission[_patientNumber];
    }

    function getPatientList(
        string memory _doctorNumber
    ) public view returns (PatientList[] memory) {
        return Dpermission[_doctorNumber];
    }
}
