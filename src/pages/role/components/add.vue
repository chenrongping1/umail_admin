<template>
  <div>
    <el-dialog
      :title="info.isAdd ? '添加菜单' : '编辑菜单'"
      :visible.sync="info.isshow"
      @closed='closed'
    >
      <el-form :model="form"  :rules="rules" ref='form'>
        <el-form-item label="角色名称" :label-width="formLabelWidth"  prop='rolename'> 
          <el-input v-model="form.rolename" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="角色权限" :label-width="formLabelWidth">
          <el-tree
            ref="tree"
            :data="list"
            show-checkbox
            node-key="id"
            :props="{children: 'children',label: 'title',}"
          >
          </el-tree>
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
        <el-button @click="isshow = false">取 消</el-button>
        <el-button type="primary" @click="submitForm(form)" v-if="info.isAdd"
          >确 定</el-button
        >

        <el-button type="primary" @click="updatereq" v-else>修改</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { warningAlert, successAlert } from "../../../untils/alert";
import { indexRoutes } from "../../../router/index";
import { mapGetters, mapActions } from "vuex";
import {reqRoleAddList,reqRoleEditList,reqRoleOneList } from "../../../untils/request";
export default {
  props: ["info"],
  data() {
    return {
      form: {
        rolename:'',
        menus:[],
        status:1,
      },
      indexRoutes,
      value: true,
      isshow: false,
      formLabelWidth: "120px",
       rules: {
        rolename: [
          {
            required: true, //是否必填
            message: "请填写角色名", //规则
            trigger: "blur", //何事件触发
          },
 /*          //可以设置双重验证标准
          { min: 3, max: 5, message: "长度在 3 到 5 个字符"}, */
        ],
      },
    };
  },
  computed: {
    ...mapGetters({
      list: "list/list",
    }),
  },
  methods: {
    ...mapActions({
      reqlist: "list/requestMenuList",
      reqRolelist:'role/requestRoleList'
    }),
    //数据重置
        closed(){
      if(!this.info.isAdd){
        this.empty()
      }
    },
    empty() {
      this.form = {
        rolename:'',
        menus:[],
        status:1,
      };
      this.$refs.tree.setCheckedKeys([]);
    },
    cancel() {
      this.info.isshow = false;
    },
    submitForm(form){

         
        this.$refs.form.validate((form) => {
          if (form) {
              this.form.menus=JSON.stringify(this.$refs.tree.getCheckedKeys());
       reqRoleAddList(this.form).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);

          this.empty();

          this.cancel();

          this.reqRolelist();
        } else {
          warningAlert(res.data.msg);
        }
      });
          } else {
            warningAlert('请填写完整信息');
            return false;
          }
        });


     
    },
    //改变type
    changePid() {
      if (this.form.pid == 0) {
        this.form.type = 1;
      } else {
        this.form.type = 2;
      }
    },
    //获取
    look(id) {
   
        
      reqRoleOneList(id).then((res) => {
        if (res.data.code == 200) {
          this.form = res.data.list;
          this.$refs.tree.setCheckedKeys(JSON.parse(this.form.menus));
          this.form.id = id;
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
    //修改
    updatereq() {
       this.form.menus=JSON.stringify(this.$refs.tree.getCheckedKeys());
      reqRoleEditList(this.form).then((res) => {
        if (res.data.code == 200) {
          successAlert(res.data.msg);
          this.empty();
          this.cancel();
          this.reqRolelist();
        } else {
          warningAlert(res.data.msg);
        }
      });
    },
  },
  mounted() {
     if(this.list.length==0){
      this.reqlist()
    }
  },
};
</script>

<style></style>
