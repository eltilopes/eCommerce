import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
 
function UsersList() {
   const [users, setUsers] = useState([]);
   useEffect(() => {
       ReadUsers()
   }, [])
 
   const ReadUsers = () => {
       fetch("https://www.mecallapi.com/api/users")
         .then(res => res.json())
         .then(
           (result) => {
             setUsers(result)
           }
         )
   }
   const UpdateUser = id => {
        window.location = '/update/'+id
   }
   const DeleteUser = id => {
        var data = {
        'id': id
        }
        fetch('https://www.mecallapi.com/api/users/delete', {
        method: 'DELETE',
        headers: {
            Accept: 'application/form-data',
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
        })
        .then(res => res.json())
        .then(
        (result) => {
            alert(result['message'])
            if (result['status'] === 'ok') {
                ReadUsers()
            }
        }
        )
    }
   return (
       <div class="flex flex-col">
           <div class="-my-2 overflow-x-auto">
               <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                   <div class="lg:flex lg:items-center lg:justify-between px-20 py-2">
                       <div class="flex-1 min-w-0">
                           <h2 class="text-2xl font-bold leading-7 text-gray-900 sm:text-3xl sm:truncate">
                           Users List
                           </h2>
                       </div>
                       <div class="mt-5 flex lg:mt-0 lg:ml-4">
                           <span class="hidden sm:block">
                           <Link to="/create">
                               <button type="button" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                   <svg class="-ml-1 mr-2 h-5 w-5 text-gray-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                   <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z" />
                                   </svg>
                                   CREATE
                               </button>
                           </Link>
                           </span>
                       </div>
                   </div>
               <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
                   <table class="min-w-full divide-y divide-gray-200">
                   <thead class="bg-gray-50">
                       <tr>
                       <th scope="col" class="px-10 py-1 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                           ID
                       </th>
                       <th scope="col" class="px-10 py-1 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                           Full Name
                       </th>
                       <th scope="col" class="px-6 py-1 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                           Email Address
                       </th>
                      
                       <th scope="col" class="relative px-6 py-1">
                           <span class="sr-only">Edit</span>
                       </th>
                       </tr>
                   </thead>
                   <tbody class="bg-white divide-y divide-gray-200">
                   {users.map((user) => (
                       <tr key={user.ID}>
                           <td class="px-10 py-4 whitespace-nowrap">
                               <div class="text-sm text-gray-500">
                                   {user.id}
                               </div>
                           </td>
                           <td class="px-6 py-4 whitespace-nowrap">
                               <div class="flex items-center">
                               <div class="flex-shrink-0 h-10 w-10">
                                   <img class="h-10 w-10 rounded-full" src={user.avatar} alt="" />
                               </div>
                               <div class="ml-4">
                                   <div class="text-sm font-medium text-gray-900">
                                  <span> {user.fname}</span> <span>{user.lname}</span>
                                   </div>
                               </div>
                               </div>
                           </td>
                           <td class="px-6 py-4 whitespace-nowrap">
                               <div class="text-sm text-gray-500">
                                   {user.username}
                               </div>
                           </td>
                           <td class="px-6 py-4 space-x-2 whitespace-nowrap text-right text-sm font-medium">
                               <button class="inline-block text-sm px-4 py-2 leading-none border rounded text-blue-800 border-blue-600 hover:bg-blue-300 hover:text-blue-500 mt-4 lg:mt-0" 
                                       onClick={() => UpdateUser(user.id)} >EDIT</button>
                               <button class="inline-block text-sm px-4 py-2 leading-none border rounded text-red-800 border-red-600 hover:bg-red-300 hover:text-red-500 mt-4 lg:mt-0" 
                                       onClick={() => DeleteUser(user.id)}>DELETE</button>
                           </td>
                       </tr>
                       ))}
                   </tbody>
                   </table>
               </div>
               </div>
           </div>
       </div>
   )
}
 
export default UsersList;