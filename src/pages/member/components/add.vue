<template>
  <div>
    <el-dialog :title="'用户编辑'" :visible.sync="info.isshow">
      <el-form ref="form" :model="form">
        <el-form-item label="手机号" :label-width="formLabelWidth">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="昵称" :label-width="formLabelWidth">
          <el-input v-model="form.nickname" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="密码" :label-width="formLabelWidth">
          <el-input v-model="form.password" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="状态" :label-width="formLabelWidth">
          <el-switch
            v-model="form.status"
            :active-value="1"
            :inactive-value="2"
          ></el-switch>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="info.isshow = false">取 消</el-button>

        <el-button type="primary" @click="updatereq">修改</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { warningAlert, successAlert } from "../../../untils/alert";
import { indexRoutes } from "../../../router/index";
import { mapGetters, mapActions } from "vuex";
import { reqMemberEdit, reqMemberInfo } from "../../../untils/request";
export default {
  props: ["info"],
  data() {
    return {
      form: {
        phone: "",
        nickname: "",
        username: "",
        password: "",
        status: 1,
      },
      password: "",
      indexRoutes,
      value: true,
      isshow: false,
      formLabelWidth: "120px",
    };
  },
  computed: {
    ...mapGetters({
      list: "member/list",
    }),
  },
  methods: {
    ...mapActions({
      reqlist: "member/requestList",
    }),
    //数据重置
    empty() {
      this.form = {
        phone: "",
        nickname: "",
        password: "",
        status: 1,
      };
    },
    cancel() {
      this.info.isshow = false;
    },

    //获取
    look(uid) {
    
      reqMemberInfo(uid).then((res) => {
        if (res.data.code == 200) {
            // this.$delete(this.form,'randstr')
          this.form = res.data.list;
          this.form.uid = uid;
            console.log('ww',res.data.list.password)
            this.form.password='';
       /*    this.password = res.data.list.password;
          this.form.password = ""; */

          // console.log(a)
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    //修改
    updatereq() {

   /*    if(!this.form.password){
          this.form.password=this.password
      } */
      reqMemberEdit(this.form).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.empty();
          this.cancel();
          this.reqlist();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
  },

  mounted() {},
};
</script>

<style></style>
