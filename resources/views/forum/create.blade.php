@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    <form action="{{route('forum.store')}}" method="post" enctype="multipart/form-data">
                    {{csrf_field()}}
                        <div class="form-group">
                            <input type="text" name="title" class="form-control" placeholder="Title...">
                        </div>
                        <div class="form-group">
                            <input type="text" name="description" class="form-control" placeholder="Description...">
                        </div>
                        <div class="form-group">
                            <input type="file" name="image" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-success btn-block">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
