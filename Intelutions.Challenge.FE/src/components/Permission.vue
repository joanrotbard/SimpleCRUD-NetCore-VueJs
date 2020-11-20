<template>
  <div class="products">
    <h3>Permissions</h3>
    <div class="card">
      <div class="card-header">
        Add a new permission
      </div>
      <div class="card-body">
        <form class="form-inline" v-on:submit.prevent="onSubmit">
          <div class="form-group">
            <label>Employee First Name</label>
            <input v-model="permissionData.EmployeeFN" type="text" class="form-control ml-sm-2 mr-sm-4 my-2"  required>
          </div>
          <div class="form-group">
            <label>Employee Last Name</label>
            <input v-model="permissionData.EmployeeLN" type="text" class="form-control ml-sm-2 mr-sm-4 my-2" required>
          </div>
          <div class="form-group">
            <label>Type</label>
            <select v-model="selectedType" required>
              <option v-for="permType in permissionsTypes" v-bind:key="permType.Id" v-bind:value="permType.Id">
                    {{ permType.Description }}
              </option>
            </select>
          </div>          
          <div class="form-group">
            <label>Permission Date</label>
            <input v-model="permissionData.PermissionDate"  type="date" class="form-control ml-sm-2 mr-sm-4 my-2" required>
          </div>
          <div class="ml-auto text-right">
            <button type="submit" class="btn btn-primary my-2">Add</button>
            
          </div>
        </form>
      </div>
    </div>

    <div class="card mt-5">
      <div class="card-header">
        Permission List
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table">
            <thead>
              <tr>
                <th>
                  Employee First Name
                </th>
                <th>
                  Employee Last Name
                </th>
                <th>
                  Type
                </th>
                <th>
                  Permission Date
                </th>
                <th>
                  Action
                </th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="permission in sortedPermissions" v-bind:key="permission.Id">
                <template v-if="editId == permission.Id">
                  <td><input v-model="editPermissionData.EmployeeFN" type="text"></td>
                  <td><input v-model="editPermissionData.EmployeeLN" type="text"></td>
                  <td>
                    <select v-model="editPermissionData.PermissionTypeNum" required>
                      <option v-for="permType in permissionsTypes" v-bind:key="permType.Id" v-bind:value="permType.Id">
                            {{ permType.Description }}
                      </option>
                    </select>
                  </td>
                  <td><input v-model="editPermissionData.PermissionDate" type="date"></td>
                  <td>
                    <span class="icon">
                      <i  @click="onEditSubmit(permission.Id)" class="fa fa-check"></i>
                    </span>
                    <span class="icon">
                      <i  @click="onCancel" class="fa fa-ban"></i>
                    </span>
                  </td>
                </template>
                <template v-else>
                  <td>
                    {{permission.EmployeeFN}}
                  </td>
                  <td>
                    {{permission.EmployeeLN}}
                  </td>
                  <td>
                    {{permTypeDesc}}
                  </td>
                  <td>
                    {{permission.PermissionDate}}
                  </td>
                  <td>

                    <a href="#" class="icon">
                      <i v-on:click="onDelete(permission.Id)" class="fa fa-trash"></i>
                    </a>
                    <a href="#" class="icon">
                      <i v-on:click="onEdit(permission)" class="fa fa-pencil"></i>
                    </a>
                  </td>
                </template>
              </tr>

            </tbody>
          </table>
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import db from '@/db'
export default {
  name: 'Permission',
  data () {
    return {
      editId: 0,
      selectedType: 0,
      permissionData: {
        'Id' : 0,
        'EmployeeFN': '',
        'EmployeeLN': '',
        'PermissionTypeNum': 0,
        'PermissionDate': ''
      },
      editPermissionData: {
        'Id' : 0,
        'EmployeeFN': '',
        'EmployeeLN': '',
        'PermissionTypeNum': 0,
        'PermissionDate': ''
      },
      permissions: [],
      permissionsTypes: [],
    }
  },
  created() {
    this.getPermissions()
    this.getPermissionTypes()
  },
  computed:{
    sortedPermissions(){
      return this.permissions
    },
    permTypeDesc(){
      return this.permissionsTypes[0].Description
    }
  },
  methods: {
    getPermissionTypes() {
      axios
      .get('https://localhost:5001/api/permissiontypes')
      .then(apiPerms => (this.permissionsTypes= apiPerms.data))
    },
    getPermissions() {
      axios
      .get('https://localhost:5001/api/permissions')
      .then(apiPerms => (this.permissions = apiPerms.data))
    },
    onSubmit(){      
      axios
      .post('https://localhost:5001/api/permissions', {
            Id: this.permissionData.Id,
            EmployeeFN: this.permissionData.EmployeeFN,
            EmployeeLN: this.permissionData.EmployeeLN,
            PermissionTypeNum: this.selectedType,
            PermissionDate: this.permissionData.PermissionDate,
        })
      .then(this.getPermissions)

      this.permissionData.Id = 0
      this.permissionData.EmployeeFN = ''
      this.permissionData.EmployeeLN = ''
      this.permissionData.PermissionTypeNum = 0
      this.permissionData.PermissionDate = ''

    },
    onDelete(Id){      
      axios
      .delete(`https://localhost:5001/api/permissions/${Id}`, {
            Id: this.editPermissionData.Id
        })
      .then(this.getPermissions)
    },
    onEdit(permission){

      this.editId = permission.Id
      this.editPermissionData.Id = permission.Id
      this.editPermissionData.EmployeeFN = permission.EmployeeFN
      this.editPermissionData.EmployeeLN = permission.EmployeeLN
      this.editPermissionData.PermissionTypeNum = permission.PermissionTypeNum
      this.editPermissionData.PermissionDate = permission.PermissionDate
    },
    onCancel(){
      this.editId = 0
      this.editPermissionData.Id = 0
      this.editPermissionData.EmployeeFN = ''
      this.editPermissionData.EmployeeLN = ''
      this.editPermissionData.PermissionTypeNum = 0
      this.editPermissionData.PermissionDate = ''
    },
    onEditSubmit (Id){
      console.log(this.permissionData.PermissionDate)
      axios
      .put(`https://localhost:5001/api/permissions/${Id}`, {
            Id: this.editPermissionData.Id,
            EmployeeFN: this.editPermissionData.EmployeeFN,
            EmployeeLN: this.editPermissionData.EmployeeLN,
            PermissionTypeNum: 1,
            PermissionDate: this.editPermissionData.PermissionDate,
        })
      .then(this.getPermissions)

        this.editId = 0
        this.editPermissionData.Id = 0
        this.editPermissionData.EmployeeFN = ''
        this.editPermissionData.EmployeeLN = ''
        this.editPermissionData.PermissionTypeNum = 0
        this.editPermissionData.PermissionDate = ''
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3{
  text-align: center;
  margin-top: 30px;
  margin-bottom: 20px;
}
.icon{
  margin-right: 10px;
}
.icon i{
  cursor: pointer;
}
</style>
