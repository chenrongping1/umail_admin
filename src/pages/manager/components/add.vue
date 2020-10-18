<template>
  <div>
    <el-dialog
      :title="info.isAdd ? '添加管理员' : '编辑管理员'"
      :visible.sync="info.isshow"
      @closed='closed'
    >
      <el-form ref="form" :model="form" :rules="rules">
        <el-form-item
          label="所属角色"
          :label-width="formLabelWidth"
          prop="roleid"
        >
          <el-select v-model="form.roleid" placeholder="请选择">
            <el-option label="请选择" value="" disabled></el-option>
            <el-option
              v-for="item in role"
              :key="item.id"
              :label="item.rolename"
              :value="item.id"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item
          label="用户名"
          :label-width="formLabelWidth"
          prop="username"
        >
          <el-input v-model="form.username" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item
          label="密码"
          :label-width="formLabelWidth"
          prop="password"
        >
          <el-input
            v-model="form.password"
            autocomplete="off"
            @change="qqqw"
          ></el-input>
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
        <el-button type="primary" @click="submitForm(form)" v-if="info.isAdd"
          >确 定</el-button
        >

        <el-button type="primary" @click="updatereq" v-else>修改</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { isPassword } from "../../../rules/index";
import { warningAlert, successAlert } from "../../../untils/alert";
import { indexRoutes } from "../../../router/index";
import { mapGetters, mapActions } from "vuex";
import {
  reqUserAdd,
  reqUserInfo,
  reqUserEditList,
} from "../../../untils/request";
export default {
  props: ["info"],
  data() {
    return {
      form: {
        roleid: "",
        username: "",
        password: "",
        status: 1,
      },
      indexRoutes,
      value: true,
      isshow: false,
      formLabelWidth: "120px",
      rules: {
        roleid: [{ required: true, message: "请填写用户名", trigger: "blur" }],
        username: [
          { required: true, message: "请填写用户名", trigger: "blur" },
        ],
        password: [
          { required: true, message: "请填写密码", trigger: "blur" },
          { validator: isPassword, trigger: "blur" },
        ],
      },
    };
  },
  computed: {
    ...mapGetters({
      list: "list/list",
      role: "role/list",
    }),
  },
  methods: {
    ...mapActions({
      reqlist: "list/requestMenuList",
      reqRolelist: "role/requestRoleList",
      reqManagerlist: "manager/requestUserList",
      changeUserCount: "manager/requestUserCount",
    }),

    qqqw() {
      console.log(this.rules);
    },
    //数据重置
    empty() {
      this.form = {
        roleid: "",
        username: "",
        password: "",
        status: 1,
      };
    },
        closed(){
        if(!this.info.isAdd){
          this.empty()
        }
    },
    cancel() {
      this.info.isshow = false;
    },
    submitForm(form) {
      this.$refs.form.validate((form) => {
        if (form) {
          reqUserAdd(this.form).then((res) => {
            if (res.data.code == 200) {
              successAlert(res.data.msg);

              this.empty();

              this.cancel();

              this.reqManagerlist();
              this.changeUserCount();
            } else {
              warningAlert(res.data.msg);
            }
          });
        } else {
          warningAlert("请填写信息");
          return false;
        }
      });
    },

    //获取
    look(id) {
      reqUserInfo(id).then((res) => {
        console.log("ww", res.data.list.password);
        if (res.data.code == 200) {
          this.form = res.data.list;
          this.form.password = "";
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    //修改
    updatereq() {
      reqUserEditList(this.form).then((res) => {
        console.log(res);
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.empty();
          this.cancel();
          this.reqManagerlist();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
  },

  mounted() {
    if (this.role.length == 0) {
      this.reqRolelist();
    }
  },
};
</script>

<style></style>
