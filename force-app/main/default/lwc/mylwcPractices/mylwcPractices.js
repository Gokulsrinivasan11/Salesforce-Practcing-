import { LightningElement,track,api,wire } from 'lwc';
// import getCreateRecords from '@salesforce/apex/MyApexPractices.getCreateRecords';
import getCreateRecords from '@salesforce/apex/MyApexPractices.getCreateRecords';
import getPicklistValues from '@salesforce/apex/MyApexPractices.getPicklistValues';
// import createGymRecord from '@salesforce/apex/MyApexPractices.createGymRecord';
export default class MylwcPractices extends LightningElement {
    @track recordName;
    @track age;
    @track mobileNumber;
    @track chooseTime;
    @track address;
    @track allValues;
    @track picklistValues = [];
    connectedCallback() {
        this.loadPicklistValues();
    }

    loadPicklistValues() {
        getPicklistValues()
            .then(result => {
                //this.picklistValues = result.map(item => ({ label: item, value: item }));
                 for (var i = 0; i < result.length; i++) {

                   // this.picklistValues.push({label: result[i], value: result[i]});
                    this.picklistValues = result[i];
                    console.log('this.picklistValues ::::::::::::::::::::    ',this.picklistValues);
                    console.log(result[i]);

                }
                //console.log('this.picklistValues ::::::::::::::::::::    ',this.picklistValues);
            })
            .catch(error => {
                console.error('Error retrieving picklist values:', error);
            });
    }
    get options() {
        return [
            { label: this.picklistValues, value: this.picklistValues },
        ];
    }

    // handleChange(event) {
    //     const { name, value } = event.target;
    //     this[name] = value;
    // }

    handleNameChange(event) {
    this.recordName = event.target.value;
    }
    handleAgeChange(event){
        this.age = event.target.value;
    }
    handleMobileNumber(event){
        this.mobileNumber = event.target.value;
    }
    handleTimeChange(event){
        this.chooseTime = event.target.value;
    }
    handleAddress(event){
        this.address = event.target.value;
    }

    handleSubmit(event) {
        event.preventDefault();

        getCreateRecords({ recordName: this.recordName ,ages: this.age,mobile: this.mobileNumber,times: this.chooseTime,address: this.address })
            .then(() => {
                // Handle success
                console.log('OUTPUT : ',this.recordName);
                console.log('OUTPUT : ',this.age);
                console.log('OUTPUT : ',this.mobileNumber);
                console.log('OUTPUT : ',this.chooseTime);
                console.log('OUTPUT : ',this.address);
                console.log('Gym record created successfully');
                // Reset form fields
                this.recordName = '';
                this.age = '';
                this.mobileNumber = '';
                this.chooseTime = '';
                this.address = '';
            })
            .catch(error => {
                // Handle error
                console.error('Error creating gym record:', error);
            });
    }

// connectedCallback() {
//     getCreateRecords({recordName: this.getValues ,ages: this.age,mobile: this.mobileNumber,times: this.chooseTime,address: this.addresses})
//     .then(result => {
//         console.log('result => ', JSON.stringify(result));
//     })
//     .catch(error => {
//         console.error(error);
//     });
// }
// handleCreateNew() {
//     getCreateRecords({recordName: this.getValues ,ages: this.age,mobile: this.mobileNumber,times: this.chooseTime,address: this.addresses})
//     .then(result => {
//         console.log('result => ', JSON.stringify(result));
//         this.allValues = result.map((cls) => Object.assign({}, { label: cls.times, value: cls.times }));
//     })
//     .catch(error => {
//         console.error(error);
//     });
// }

// @wire(getCreateRecords, {recordName: '$getValues' ,ages: '$age',mobile: '$mobileNumber',times: '$chooseTime',address: '$addresses'})
// handleCreateNew({error,data}){
//     if (data) {
//             console.log('result => ', JSON.stringify(data));
//             this.allValues = data.map((cls) => Object.assign({}, { label: cls.times, value: cls.times }));
//             console.log('allValues====     : ',this.allValues);
//         } else if (error) {
//             this.error = error;
//             console.error('error => ', error); // error handling
//         }
// }
}