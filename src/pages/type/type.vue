<template>
  <div>
    <el-button type="primary" @click="willAdd" >添加</el-button>
    <v-add :info='info' ref='add'></v-add>
    <v-list @edit='edit'></v-list>
  
  </div>
</template>

<script>
import vList from './components/list'
import vAdd from './components/add'
export default {
  data(){
    return{
        info: {
        //添加弹框的状态
        isshow: false,
        //添加还是编辑的状态 true添加 ，false 编辑
        isAdd:true
      },
    }
  },
    components:{
        vList,
        vAdd
    },
    methods:{
      willAdd(){
        this.info.isshow=true;
        this.info.isAdd=true;
      },
      edit(id){
        this.info.isshow=true;
        this.info.isAdd=false;
        this.$refs.add.look(id)
      }
    }
}
</script>

<style>

</style>