<template>
  <div class="wrapper">
    <div class="wrapper-item0">
        <input type="text" placeholder="Input Text" class="wrapper-item0-left" :autofocus=true v-model="input_todo" @change="onchange" @input="oninput"/>
        <text class="wrapper-item0-right" @click="submitAction">提交</text>
    </div>
    <list class="wrapper-item1">
        <cell class="cell" v-for="(num,index) in list" :key="index">
        <div class="panel">
            <text class="text">{{num}}</text>
        </div>
        </cell>
    </list>
    <!-- <HelloWorld/> -->
  </div>
</template>

<script>
// import HelloWorld from './components/HelloWorld'
export default {
  name: 'App',
  components: {
    // HelloWorld
  },
  data () {
    return {
      // logo: 'https://gw.alicdn.com/tfs/TB1yopEdgoQMeJjy1XaXXcSsFXa-640-302.png'
      list: [],
      input_todo: ''
    }
  },
  methods: {
    onchange: function(event){
      console.log('onchange',event.value);
    },
    oninput: function (event) {
      console.log('oninput', event.value);
    },
    submitAction: function () {
      console.log(this.input_todo);
      this.list.push(this.input_todo);
      this.input_todo = "";
    }
  }
}
</script>

<style scoped>

  .wrapper {
      width: 750px;
      height: 1334px;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: center;
      background: #F0F0F0;
  }
  .wrapper-item0 {
      width: 750px;
      height: 120px;
      background: orange;
      display: flex;
      flex-direction: row;
      justify-content: space-around;
      align-items: center;
  }
  .wrapper-item0-left {
      width: 85%;
      height: 80px;
      background: orange;
      padding-left: 30px;
      padding-right: 20px;
  }

  .wrapper-item0-right {
      width: 15%;
      /* height: 80px; */
      /* background: red; */
      padding-left: 20px;
      /* margin-left: 0px;
      margin-right: 30px; */
  }
  .wrapper-item1 {
      width: 750px;
      height: 1214px;
  } 
.panel {
    width: 600px;
    height: 300px;
    margin-left: 75px;
    margin-right: 75px;
    margin-top: 35px;
    margin-bottom: 35px;
    flex-direction: column;
    justify-content: center;
    border-width: 2px;
    border-style: solid;
    border-color: rgb(162, 217, 192);
    background-color: rgba(162, 217, 192, 0.2);
  }
  .text {
    font-size: 88px;
    text-align: center;
    color: #41B883;
  }
  .input {
    height: 80px;
    width: 620px;
    background-color:  #F0F0F0;
    margin-left: 30px;
    margin-right: 100px;
  }
  
  /* .logo {
    width: 424px;
    height: 200px;
  }
  .greeting {
    text-align: center;
    margin-top: 70px;
    font-size: 50px;
    color: #41B883;
  }
  .message {
    margin: 30px;
    font-size: 32px;
    color: #727272;
  } */
</style>
