<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BlogController extends Controller
{
    public function index(Request $request)
    {
        $perPage = $request->query('per_page', 10);
        $blogs = Blog::with('creator:id,name,email')
            ->orderBy("created_at", "desc")
            ->paginate($perPage);
        return response()->json($blogs, 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'photo' => 'required|string',
        ]);

        $blog = Blog::create([
            'title' => $request->input('title'),
            'content' => $request->input('content'),
            'photo' => $request->input('photo'),
            'creator_id' => Auth::id(),
        ]);

        return response()->json([
            "data" => $blog,
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $blog = Blog::findOrFail($id);

        if ($blog->creator_id !== Auth::id()) {
            return response()->json(['message' => 'You are not the owner of this blog'], 403);
        }

        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'photo' => 'required|string',
        ]);

        $blog->update([
            'title' => $request->input('title'),
            'content' => $request->input('content'),
            'photo' => $request->input('photo'),
        ]);

        return response()->json([
            "data" => $blog,
        ], 200);
    }

    public function destroy($id)
    {
        $blog = Blog::findOrFail($id);

        if ($blog->creator_id !== Auth::id()) {
            return response()->json(['message' => 'You are not the owner of this blog'], 403);
        }

        $blog->delete();
        return response()->json([
            "data" => [
                "message" => "Success",
            ],
        ], 200);
    }
}
