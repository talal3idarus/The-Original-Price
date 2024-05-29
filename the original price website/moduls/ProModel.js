import mongoose from "mongoose";

const ProSchema = mongoose.Schema({
    PID:{type:String,required:true},
    PNAME:{type:String,required:true},
    PINFO:{type:String,required:true},
    PPRICE:{type:Number,required:true},
    PPTAX:{type:Number,required:true},
    BRAND:{type:String,required:true},
    IMAGE:{type:String,required:true},
});

const ProModel=mongoose.model("Product",ProSchema,"Product");
export default ProModel;