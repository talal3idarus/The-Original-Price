import mongoose from "mongoose";

const ADMSchema = mongoose.Schema({
    ADMINNAME:{type:String,required:true},
    ADMINPASS:{type:String,required:true},
});

const AdmModel=mongoose.model("Admin",ADMSchema,"Admin");
export default AdmModel;