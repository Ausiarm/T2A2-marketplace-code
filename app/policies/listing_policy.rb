class ListingPolicy < ApplicationPolicy
    # authorization rules will go here
    # if user is admin and/or they created the listing, they can access the delete action

    def destroy?
        user.role == 'admin' || record.user == user
    end

    def edit?
        user.role == 'admin' || record.user == user
    end

end