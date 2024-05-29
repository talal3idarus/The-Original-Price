import mongoose from "mongoose";

const ReqSchema = mongoose.Schema({
    RNAME:{type:String,required:true},
    RPHONE:{type:String,required:true},
    SHOPL:{type:String,required:true},
    REMAIL:{type:String,required:true},
});

const ReqModel=mongoose.model("ReqAD",ReqSchema,"ReqAD");
export default ReqModel;