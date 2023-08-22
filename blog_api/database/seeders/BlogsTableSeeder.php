<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Blog;

class BlogsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Deny',
            'email' => 'admin@demo.com',
            'password' => Hash::make('123456'),
        ]);

        User::create([
            'name' => 'Monalisa',
            'email' => 'user@demo.com',
            'password' => Hash::make('123456'),
        ]);

        $blogs = [
            [
                'title' => 'Street Photography Tutorial',
                'content' => 'This is the content of Sample Blog 1.',
                'photo' => 'https://images.unsplash.com/photo-1692602658272-e5b2fe4b6487?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
                'creator_id' => 1, 
            ],
            [
                'title' => 'NodeJS Tutorial',
                'content' => 'This is the content of Sample Blog 2.',
                'photo' => 'https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                'creator_id' => 1,
            ],
        ];

        foreach ($blogs as $blog) {
            Blog::create($blog);
        }
    }
}
