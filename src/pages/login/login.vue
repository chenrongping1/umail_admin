<template>
  <div class="bgc">
    <div class="total">

   <!--    <el-alert
    title="成功提示的文案"
    type="success">
  </el-alert> -->

      <el-row>
        <el-col :span="12" :offset="6">
          <h1 class="line">登录</h1>
          <div class="line">
            <el-input placeholder="请输入账号" clearable v-model="form.username"></el-input>
          </div>
          <div class="line">
            <el-input placeholder="请输入密码" clearable show-password  v-model="form.password"  @keydown.enter.native="login"></el-input>
          </div>
          <div class="line">
            <el-button type="primary" @click="login" >登录</el-button>
          </div>
        </el-col>
      </el-row>
    </div>
   
  </div>
</template>

<script>
import {reqLogin} from '../../untils/request'
import {mapGetters,mapActions} from 'vuex'
import { warningAlert, successAlert } from "../../untils/alert";
export default{
  data(){
    return{
      form:{
        username:'',
        password:'',
      }
    }
  },
  methods:{
    ...mapActions({
          reqUserInfo:'reqUserInfo'
    }),
    login(){
      console.log(111)
      reqLogin(this.form).then((res)=>{
          if(res.data.code==200){
            console.log(111)
            successAlert(res.data.msg)

            this.reqUserInfo(res.data.list)
            this.$router.push('/')
          }else{
            warningAlert(res.data.msg)
          }
      })
      // 
    }
  }
};
</script>

<style  scoped>
.bgc {
  width: 100vw;
  height: 100vh;
  background: linear-gradient(to right, rgb(85, 53, 67), rgb(53, 60, 92));
  display: flex;
  justify-content: center;
  align-items: center;
}
.total {
  background: #fff;
  width: 400px;
  height: 300px;
  border-radius: 20px;
}
h1 {
  font-size: 30px;
  text-align: center;
}
.line {
  text-align: center;
  margin-top: 20px;
}
</style>