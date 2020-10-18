import Vue from 'vue'
import filterPrice from './filterPrice'
import filterTime from './filterTime'
import filterEndTime from './filterEndTime'
let obj ={
    filterPrice,
    filterTime,
    filterEndTime
}
for(let i in obj){
    Vue.filter(i,obj[i])
}